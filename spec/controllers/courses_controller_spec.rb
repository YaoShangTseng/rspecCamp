require 'rails_helper'

RSpec.describe CoursesController do
  describe "GET index" do
    it "assigns @courses and render" do
      course1 = create(:course)
      course2 = create(:course)

      get :index

      expect(assigns[:courses]).to eq([course1, course2])
    end

    it "render template" do
      course1 = create(:course)
      course2 = create(:course)

      get :index

      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    it "assigns @course" do
      course = create(:course)

      get :show, params: { id: course.id }

      expect(assigns[:course]).to eq(course)
    end

    it "render template" do
      course = create(:course)

      get :show, params: { id: course.id }

      expect(response).to render_template("show")
    end

  end

  describe "GET new" do

    it "assign @course" do
      course = build(:course)

      get :new

      expect(assigns(:course)).to be_a_new(Course)
    end

    it "render_template" do
      course = build(:course)

      get :new

      expect(response).to render_template("new")
    end

  end

  describe "POST create" do
    context "when course doesn't have a title" do
      it "doesn't create a record" do
        expect do
          post :create, params: { course: { description: "bar" } }
        end.to change { Course.count }.by(0)
      end

      it "render new template" do
        post :create, params: { course: { description: "bar" } }

        expect(response).to render_template("new")
      end
    end

    context "when course have a title" do
      it "create a new course record" do
        course = FactoryGirl.build(:course)

        expect do
          post :create, params: { course: attributes_for(:course) }
        end.to change { Course.count }.by(1)
      end

      it "redirects to courses_path" do
        course = FactoryGirl.build(:course)

        post :create, params: { course: attributes_for(:course) }

        expect(response).to redirect_to courses_path
      end
    end

  end

  describe "GET edit" do
    it "assign course" do
      course = create(:course)

      get :edit, id: course.id

      expect(assigns[:course]).to eq(course)
    end
    it "render template" do
      course = create(:course)

      get :edit, id: course.id

      expect(response).to render_template("edit")
    end
  end

end
